# A11Y Testing

In the tech sector we often shorten the word "accessibility" to "a11y". This is a numeronym, where the number 11
represents the 11 letters between the first letter "a" and the last letter "y". The term is used to refer to the
practice of making web applications and websites accessible to all users, including those with disabilities. This
includes ensuring that web applications are usable by people with visual, auditory, motor, and cognitive disabilities.

## Why is accessibility important?

With the European Accessibility Act coming into effect in 2025 (EAA2025), it is important to ensure that your web
applications are accessible to all users. The EAA2025 is an european directive that requires all public sector websites
and applications to be accessible to people with disabilities. Failing to comply with the law could result in penalties
including fines for European public-sector organisations.

It is therefore important to ensure that your web applications are accessible to all users. This is where accessibility
testing comes in, to test if your web application is compliant with the Web Content Accessibility Guidelines (WCAG). The
WCAG is a set of guidelines created by the [World Wide Web Consortium (W3C)](https://www.w3.org/) to ensure that web
content is accessible to all users. The guidelines are divided into four principles: Perceivable, Operable,
Understandable, and Robust (POUR). These principles are further divided into 13 guidelines, which are then divided into
testable success criteria. The success criteria are divided into three levels of conformance: A, AA, and AAA. Level A is
the minimum level of accessibility, while level AA is the recommended level for most web applications. Level AAA is the
highest level of accessibility, but is not required for most web applications. The WCAG guidelines are constantly being
updated to reflect the latest developments in web technology and accessibility standards. To be compliant with the
EAA2025, web applications must meet the [WCAG 2.1](https://www.w3.org/TR/WCAG21/) AA success criteria.

As a developer we can use a variety of tools to test our web applications for accessibility. These tools can help us
identify accessibility issues and provide suggestions for how to fix them. In this article, we will discuss some of the
most popular accessibility testing tools and how to use them to test your web applications.

> [!NOTE]
>
> The tools mentioned in this article only cover a subset of the WCAG 2.1 AA success criteria. It is important to note
> that not all accessibility issues can be detected by automated tools. It is therefore important to also perform manual
> testing to ensure that your web applications are accessible to all users and compliant with the EAA2025.

## Tools

There are a variety of tools available to test web applications for accessibility. Unfortunately, most of these tools
are not free, and non of them cover all of the WCAG 2.1 AA success criteria. However, there are some free tools
available that can help you test your web applications for accessibility.

### Browser Extensions

There are a variety of browser extensions available that can help you test your web applications for accessibility.

[**Axe**](https://www.deque.com/axe/) Browser Extension from [deque](https://www.deque.com/) is one of the most popular
accessibility testing tool available. It is a free browser extension that can be used to test web applications for
accessibility. Axe is available for Chrome, Edge and Firefox, and can be used to test web applications for accessibility
issues.  
The free browser extension of Axe, which you access via the developer tools of your browser, allows you to test a full
page for accessibility issues. If you do so, make sure that you set the "Best Practices" option to "On".  
In this couse we expect that you at least have tested your web applications with the Axe browser extension.

[**ARC Toolkit**](https://www.tpgi.com/arc-platform/arc-toolkit/) from [TPGi](https://www.tpgi.com/) is also a very
powerfull browser extension for Google Chrome and Firefox that like Axe covers a wide range of accessibility issues.
Like Axe you access the ARC Toolkit via the developer tools of your browser. Check out the buttons "Highlight" and
"Other Tools" in the ARC Toolkit after running a test, to see for instance a visual taborder of the page, like the tool
Tab11y does. Or use the links in the "Other Tools" section, to validate the HTML.

[**Lighthouse**](https://developers.google.com/web/tools/lighthouse) is a free, open-source tool that can be used to
that is integrated into the Chrome DevTools. The accessibility audit in Lighthouse is based on axe-core but unlike
testing with the Axe browser extension, Lighthouse does not test the page at it's current state. Instead, it tests the
page as it shows after a reload. This means that if you have a page that loads content dynamically, the Lighthouse test
might not show all of the accessibility issues.

> [!NOTE]
>
> Testing a page in different states is important. For instance, if you have a page that loads content dynamically, you
> should test the page in both states: before and after the content is loaded. The same applies to pages of a site that
> offers a light/dark mode. This is important because some accessibility issues might only show up in one of the states.

### IDE Extensions

There are a couple of IDE extensions available that can help you to write accessible code, before you even run a test on
your web application. For VSCode the
[**axe Accessibility Linter**](https://marketplace.visualstudio.com/items?itemName=DequeSystems.axe-linter) is the most
popular extension. It is a free extension that can be used to test your code for accessibility issues.

### Automated Testing

For continuous integration and continuous deployment (CI/CD) pipelines, there the number of freely available tools is
limited. The most popular tool is [**axe-core**](https://github.com/dequelabs/axe-core) from
[Deque](https://www.deque.com/). It is a free, open-source library that can be used to test web applications for
accessibility issues. It is available for a variety of programming languages, including JavaScript, Java, and Python.
We will cover the usage of axe-core in the [E2E Testing](./e2e-testing.md) section.

---

## Sources

- [MDN - Web Accessibility](https://developer.mozilla.org/en-US/docs/Web/Accessibility)
- [European Commission - News Article](https://accessible-eu-centre.ec.europa.eu/content-corner/news/eaa-comes-effect-june-2025-are-you-ready-2025-01-31_en)
- [European Accessibility Act](https://ec.europa.eu/social/main.jsp?catId=1202&langId=en)
- [Web Content Accessibility Guidelines (WCAG) 2.1](https://www.w3.org/TR/WCAG21/)
- [web.dev - Learn accessibility](https://web.dev/learn/accessibility/)

---

:house: [Home](../README.md) | :arrow_backward: [ESLint Testing](./eslint-testing.md) | :arrow_up:
[Testing](./README.md) | [Unit Testing](./unit-testing.md) :arrow_forward:
