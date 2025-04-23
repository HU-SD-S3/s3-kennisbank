# RxJS Observables

[RxJS](https://rxjs.dev) is the most popular library for implementing the observer pattern in JavaScript. To use RxJS,
we need to install it first. We can do this by running the following command in our project directory:

```bash
npm install rxjs
```

## Observerable

In RxJS, an observable is a data source that can emit values over time. Observables are created using the `Observable`
class. The `Observable` class takes a function as an argument, which is called the "subscriber function". This function
is called when the observable is subscribed to. The subscriber function takes an object as an argument, which is called
the "observer". The observer has three methods: `next`, `error`, and `complete`. The `next` method is called when the
observable emits a value, the `error` method is called when an error occurs, and the `complete` method is called when
the observable completes.

We therefore created a web component `RxJSDataGenerator` that offers two buttons. One to generate a random number meant
to be stored using the service layer (`RxJSDataService`). An another button to end the data stream, by disabling the
button to add a number and to inform the our data service that the data stream is ended.

```javascript
import { LitElement, html } from 'lit';
import { rxJSDataService } from '../../service/rxjs-data-service';

export class RxJSDataGenerator extends LitElement {
  // eslint-disable-next-line class-methods-use-this
  addData() {
    rxJSDataService.addData(Math.random());
  }

  endDataGeneration() {
    // disable the Add Data button
    this.shadowRoot.querySelector('button').disabled = true;
    rxJSDataService.endDataStream();
  }

  render() {
    return html`
      <button @click=${this.addData}>Add Data</button>
      <button @click=${this.endDataGeneration}>End Data Generation</button>
    `;
  }
}

customElements.define('rxjs-data-generator', RxJSDataGenerator);
```

Our `RxJSDataService` class uses the `Observable` class from RxJS to create an observable data source. The `addData`
method adds a new item to the data source and notifies the subscriber about the change. The `endDataStream` method
completes the observable, which means that no more values will be emitted.
Our observable of our data will be stored in a public property called `serviceData$`, which is an instance of the
`Observable` class. The `$` at the end of the property name is a convention to indicate that this property is an observable.

```javascript
import { Observable } from 'rxjs';

class RxJSDataService {
  #serviceData = [];
  serviceData$ = null;

  constructor() {
    this.serviceData$ = new Observable((subscriber) => {
      this.subscriber = subscriber;
    });
  }

  addData(item) {
    this.#serviceData = [...this.#serviceData, item];
    this.subscriber.next(this.#serviceData);
  }

  endDataStream() {
    this.subscriber.complete();
  }
}

const rxJSDataService = new RxJSDataService();

export { rxJSDataService };
```

The `RxJSDataObserver` class subscribes to the observable data source and updates its state when new data is emitted.
The `next` method is called when new data is emitted, and the `complete` method is called when the observable completes.

```javascript
import { rxJSDataService } from '../../service/rxjs-data-service';

import { LitElement, html } from 'lit';

class RxJSDataObserver extends LitElement {
  static properties = {
    data: { type: Array },
  };

  constructor() {
    super();
    this.data = [];
    this.observer = {
      next: (data) => {
        this.data = data;
      },
      error: (err) => {
        console.error('Error:', err);
      },
      complete: () => {
        console.log('Completed');
      },
    };
  }

  connectedCallback() {
    super.connectedCallback();
    this.subscription = rxJSDataService.serviceData$.subscribe(this.observer);
  }
  disconnectedCallback() {
    this.subscription.unsubscribe();
    super.disconnectedCallback();
  }
  render() {
    return html`
      <div>
        <h2>RxJS Data Observer</h2>
        <ul>
          ${this.data.map((item) => html`<li>${item}</li>`)}
        </ul>
      </div>
    `;
  }
}
customElements.define('rxjs-data-observer', RxJSDataObserver);
```

What you will see in the browser given the following content of the body of the `index.html` file:

```html
...
<rxjs-data-generator></rxjs-data-generator>
<rxjs-data-observer></rxjs-data-observer>
<rxjs-data-observer></rxjs-data-observer>
...
```

Is that we can generate random numbers by clicking the "Add Data" button. And that when we click the "End Data
Generation" button, the "Add Data" button is disabled and on the console we see the message "Completed". But we will
also see that only the last added rxjs-data-observer will show the data. This is because in the `RxJSDataService` class
we only store a single subscriber and not a collection of subscribers. So the last subscriber will overwrite the
previous one.

We could fix this by storing a collection of subscribers and notifying all of them when new data is emitted. But this is not
the way RxJS is designed, this is were the `Subject` class of RxJS comes into play.

## Subject

To change our implementation to use the `Subject` class, we need to change the `RxJSDataService` class to use the
`Subject` class instead of the `Observable` class.
The `Subject` class is a special type of observable that allows us to multicast values to multiple observers. This means that we can use it to emit values to multiple subscribers. 
The `Subject` class is a subclass of the `Observable` class, which means that it inherits all the methods
and properties of the `Observable` class. The `Subject` class also provides us with a `subscribe` and `unsubscribe` method and it expects an observer as an argument of the `subscribe` methods, that holds an object which implements the `next`, `error`, and `complete` methods.

```javascript
import { Subject } from 'rxjs';

class RxJSDataService {

  #serviceData = [];
  serviceData$ = new Subject();

  addData(item) {
    this.#serviceData = [...this.#serviceData, item];
    this.serviceData$.next(this.#serviceData);
  }

  endDataStream() {
    this.serviceData$.complete();
  }
}

const rxJSDataService = new RxJSDataService();

export { rxJSDataService };
```

If you now run the example again, you will see that all `rxjs-data-observer` components will show the data.

Note that except for the `Subject` class, RxJS also provides a `BehaviorSubject` and a `ReplaySubject` class. The `BehaviorSubject` class is a special type of subject that requires an initial value and emits its current value to new subscribers. The `ReplaySubject` class is a special type of subject that emits a specified number of previous values to new subscribers.

## RxJS Operators

RxJS also provides a lot of operators that can be used to transform, filter, and combine observables. Some of the most
common operators are:

- `map`: transforms the emitted values of an observable
- `filter`: filters the emitted values of an observable
- `merge`: combines multiple observables into one observable
...

They work in a similar way as the `Array` methods like `map`, `filter`, and `reduce`. The difference is that they work with
observables instead of arrays. This means that they can be used to transform, filter, and combine values over time.

For more information about RxJS operators, you can check the [RxJS documentation](https://rxjs.dev/guide/operators) and experiment with them at [RxMarbles](https://rxmarbles.com/).

---

## Sources

- [RxJS](https://rxjs.dev/)
- [RxMarbles](https://rxmarbles.com/)

---

:house: [Home](../README.md) | :arrow_backward: [Vanilla JS Observables](./observables-vanilla-js.md) | :arrow_up:
[Data Exchange](./README.md) | [Challenges](./challenges.md) :arrow_forward:
