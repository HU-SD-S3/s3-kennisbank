# Backend communication

In this article we will discuss the communication between the front-end and the back-end using a REST API.

## Boilerplate setup

To demonstrate the communication with a back-end, we will setup a site that shows a list of images. We therefore create
a new web component that will show us the images. Create a new file `image-list.js` in the `src/view/components` folder
and add the following code:

```javascript
import { LitElement, html, css } from 'lit';

export class ImageList extends LitElement {
  static properties = {
    images: { type: Array },
  };

  static styles = css`
    ul {
      list-style: none;
      padding: 0;
    }

    li {
      display: inline-block;
      margin: 10px;
    }
  `;

  constructor() {
    super();
    this.images = [];
  }

  connectedCallback() {
    super.connectedCallback();
  }

  render() {
    return html`
      <h1>Image List</h1>
      <ul>
        ${this.images.map((image) => html`<li>image placeholder</li>`)}
      </ul>
    `;
  }
}

customElements.define('image-list', ImageList);
```

Our component holds a reactive property `images` that will hold the images we want to show. In the constructor we
initialize this property with an empty array. In the `render` method we loop over the images and show them in a list.
Next we import this component in the `home-page.js` file of the `src/view/pages` folder.

```javascript
import '../components/image-list';
```

And we setup the `index.html` file to show the `image-list` component.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="icon" type="image/svg+xml" href="/lit.svg" />

    <title>Kennisbank Frontend Communication</title>

    <script type="module" src="/src/view/pages/home-page.js"></script>
  </head>
  <body>
    <image-list></image-list>
  </body>
</html>
```

## Fetching the data

As source for the images we will use the [Picsum](https://picsum.photos/). This site provides a REST API that we can use
to fetch a list of images. So we need to decide where in the code we will fetch the images. As discussed in the previous
chapter, about the lifecycle callbacks, the `constructor` and the `render` method aren't the right places to fetch the
data, but the `connectedCallback` is. So we will add the fetch call to the `connectedCallback` method of the
`image-list.js` file.

```javascript
  connectedCallback() {
    super.connectedCallback();
    fetch(`https://picsum.photos/v2/list`)
    .then(response => response.json())
    .then(images => {
      this.images = images;
      console.log(this.images);
    });
  }
```

This code will assign the fetched images to the `images` property of the component, trigger a re-render and log the
images to the console. From the console we can see that the images are fetched correctly and that we can use the
download_url property to show the images in our list.

So let's update the `render` method to show the images.

```javascript
  render() {
    return html`
      <h1>Image List</h1>
      <ul>
        ${this.images.map(
          (image) =>
            html`<li><img src="${image.download_url}" alt="${image.author}"></li>`,
        )}
      </ul>
    `;
  }
```

We now see the images in our list, but they are way to big.  
Expect for the size of the images, which we could fix with some css, there is also something to say about the
architecture of our code.  
Imagen that we would have multiple components that need to fetch the images from the Picsum API. We would have to
duplicate the fetch call in all these components. Now imagine that we would have to pay for the amount of requests we
make to the Picsum API. This would mean that our application likely would have to pay multiple times for the same
images. Costs that we could avoid by caching the images we fetch and reuse the cached images in all components that need
them. So we need to think about a way to separate the fetching of the images from the component itself. This is a good
practice in general, because it allows us to reuse the code and makes it easier to test and maintain. It also is a good
practice to separate the concerns of the components and the data fetching. The component should only be responsible for
the presentation of the data, not for fetching it. This means that we should move the fetching of the images to a
service that we can use in all components that need the images.

> [!TIP]
>
> Never call the `fetch`- or a storage (like `localstorage` and/or `sessionstorage` etc.) related statement from within
> a web component / the view layer.

## Services

We will create a new folder `services` in the `src` folder and add a new file `picsum-service.js` to it. From the
documentation of the Picsum API we know that we can fetch a list of images by calling the
`https://picsum.photos/v2/list` endpoint. So we will add a method `getImages` to the `PicsumService` class that will
fetch the images from this endpoint. The API also allows us to specify the number of images we want to fetch and the
page we want to fetch. So we will add these parameters to the `getImages` method. Finally we create a constant
`picsumService` that holds an instance of the `PicsumService` class and export it. This way we can import the
`picsumService` instance in the components that need the images and not the class itself. This is one way to implement
the Singleton pattern in JavaScript.

```javascript
class PicsumService {
  constructor() {
    this.url = 'https://picsum.photos/';
  }

  getImages(nrOfImages, page) {
    return fetch(`${this.url}v2/list?page=${page}&limit=${nrOfImages}`).then((response) => response.json());
  }
}

const picsumService = new PicsumService();

export { picsumService };
```

Creating a service class is a good way to separate the concerns of the components and the data fetching. The service
class is responsible for knowing where the data is stored and how to fetch it. This would allow us to easily change the
API we use to fetch the images, without having to change the components that use the images. We could for instance now
implement a caching mechanism in the `PicsumService` class, so that we don't have to fetch the images every time we need
them. But know that even if we would implement a caching mechanism, our web component would not know about it. It would
just call the `getImages` method of the `picsumService` instance and get the images it needs. This means that a method
in a service class should always return a promise, so that the component can wait for the data to be fetched.

> [!TIP]
>
> The service class method should always return a promise, never the data itself.

Another aspect of the separation of concern is that a service class should not know about the components that use it.
This means that the service class should not call a method of a component to update the data, and should also not use
any DOM related methods. The service class should only know about where the data it fetches is located and how to fetch
it.

> [!TIP]
>
> A service class should never call any DOM related methods.

So let's update the `image-list.js` file to use the `picsumService` instance to fetch the images using the service
class. Which means that we have to import the `picsumService` instance in the `image-list.js` file and have to rewrite
the `connectedCallback` method to use the `picsumService` instance to fetch the images.

```javascript
import { LitElement, html, css } from "lit";
import { picsumService } from '../../service/picsum-service';

...

  connectedCallback() {
    super.connectedCallback();
    const nrOfImages = 50;
    const page = 6;
    picsumService.getImages(nrOfImages, page).then((images) => {
      this.images = images;
      console.log(this.images);
    });
  }

...
```

Running the application now will show the images in the list again, but now the fetching of the images is done by the
`picsumService` instance and not by the `image-list` component itself.  
The problem that remains now is that the images are still to big. We could fix this by adding some css to the
`image-list.js` file. Setting the image size via CSS however would mean that we still would download the full size image
and rescale it in the browser. This would result in a long loading time on a slow network and a lot of unnessesary data
usage.  
But the picsum API offers us another way to solve this. If we take a look at a single array item in the console, we see
something like:

```json
{
  "author": "Kristian Karlsson",
  "download_url": "https://picsum.photos/id/263/3429/5000",
  "height": 5000,
  "id": "263",
  "url": "https://unsplash.com/photos/NUBjCmEgbHM",
  "width": 3429
}
```

We can see a `width` and a `height` property, and that the `download_url` property contains those values. And from the
API documentation we can extract that we can change the size of the image by changing the values in the `download_url`
property.

So to reduce the images download time and size we can change the `download_url` property, for each item in the result of
the `getImages` method, in order to let the `img-tag` of view component fetch an URL of a smaller sized image.

This means that the service class should not only be responsible for fetching the data, but also for transforming it. If
this data transformation is indeed a task of the service or a task we allocate to a different architecture layer, is a
question we will debate in the architecture section.

## Active polling, WebSockets and Server-Sent Events

The last thing we need to discuss is how to keep the data in sync between the front-end and the back-end. This is a
common problem in the communication between the front-end and the back-end is that the data on the back-end can change
and the front-end needs to be notified about these changes. There are several ways to solve this problem, but one of the
most common ways is to use active polling. This means that the front-end will regularly check the back-end for changes.
This can be done by using the `setInterval` method in JavaScript. This method will call a function at regular intervals.
But active polling is not the most efficient way to solve this problem, because it will generate a lot of requests to
the back-end, even if there are no changes. This can lead to a lot of unnecessary data usage and a lot of load on the
back-end.

**WebSockets** and **Server-Sent Events (SSE)** are two other ways to solve this problem. But they require a different
setup of the back-end and the front-end, and are beyond the scope of this article. So we will not discuss them in detail
here.

**WebSockets** are a protocol that allows for full-duplex communication between the front-end and the back-end. This
means that the front-end can send messages to the back-end and the back-end can send messages to the front-end. This is
a more efficient way to solve this problem, because it will only generate requests when there are changes. **Server-Sent
Events (SSE)** are a way to send messages from the back-end to the front-end. This is a one-way communication, which
means that the front-end can only receive messages from the back-end. This is a good solution for this problem, because
it will only generate requests when there are changes.

---

## Sources

- [DEV.to - Separation of concerns](https://dev.to/tamerlan_dev/separation-of-concerns-the-simple-way-4jp2)
- [MDN - Server Sent Events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events)
- [MDN - WebSockets](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API/Writing_WebSocket_client_applications)

---

:house: [Home](../README.md) | :arrow_up: [Data Exchange](./README.md) |
[Attribute based communication](./attributes-based-communication.md) :arrow_forward:
