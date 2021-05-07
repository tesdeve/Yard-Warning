import { registerRoute } from 'workbox-routing';
import { NetworkFirst, StaleWhileRevalidate, CacheFirst } from 'workbox-strategies';
import { CacheableResponsePlugin } from 'workbox-cacheable-response';
import { ExpirationPlugin } from 'workbox-expiration';

// Loading pages (and turbolinks requests), checks the network first
registerRoute(
  ({request}) => request.destination === "document" || (
    request.destination === "" &&
    request.mode === "cors" &&
    request.headers.get('Turbolinks-Referrer') !== null
  ),
  new NetworkFirst({
    cacheName: 'documents',
    plugins: [
      new ExpirationPlugin({
        maxEntries: 5,
        maxAgeSeconds: 5 * 60, // 5 minutes
      }),
      new CacheableResponsePlugin({
        statuses: [0, 200],
      }),
    ],
  })
);

// For CSS & JS, we check the cache first
registerRoute(
  ({request}) => request.destination === "script" ||
  request.destination === "style",
  new CacheFirst({
    cacheName: 'assets-styles-and-scripts',
    plugins: [
      new ExpirationPlugin({
        maxEntries: 5,
        maxAgeSeconds: 60 * 60 * 24 * 30, // 30 Days
      }),
      new CacheableResponsePlugin({
        statuses: [0, 200],
      }),
    ],
  })
);

// For Images, we check the cache first
registerRoute(
  ({request}) => request.destination === "image",
  new CacheFirst({
    cacheName: 'assets-images',
    plugins: [
      new ExpirationPlugin({
        maxEntries: 5,
        maxAgeSeconds: 60 * 60 * 24 * 30, // 30 Days
      }),
      new CacheableResponsePlugin({
        statuses: [0, 200],
      }),
    ],
  })
);

// self.addEventListener('install', function(event) {
//     console.log('Service Worker installing.');
// })
//self.addEventListener('activate', function(event) {
//    console.log('Service Worker activated.');
//});
//self.addEventListener('fetch', function(event) {
//    console.log('Service Worker fetching.');
//})


//LATEST BEFORE THE CURRENT ONE


// console.log('Service Worker!!!!' );
// 
// 
// import {registerRoute} from 'workbox-routing';
// import {CacheFirst} from 'workbox-strategies';
// 
// registerRoute(
//   ({request}) => true,
//   new CacheFirst({
//     cacheName: 'static-resources',
//   })
// );


//////////////////////////////////////////////////////////////////////////////////////////////////

// self.addEventListener('install', function(event) {
//     console.log('Service Worker installing.');
// });

// self.addEventListener('activate', function(event) {
//     console.log('Service Worker activated.');
// });
// self.addEventListener('fetch', function(event) {
//     console.log('Service Worker fetching.');
// });


//////////////////////////////////////////////////////////////////////////////////////////////////

// 2nd Change

// const OFFLINE_VERSION = 1;
// const CACHE_NAME = 'offline';
// const OFFLINE_URL = 'offline';

// self.addEventListener('install', function (event) {
//   event.waitUntil((async () => {
//     const cache = await caches.open(CACHE_NAME);
//     // Setting {cache: 'reload'} in the new request will ensure that the response
//     // isn't fulfilled from the HTTP cache; i.e., it will be from the network.
//     await cache.add(new Request(OFFLINE_URL, {cache: 'reload'}));
//   })());
// });

// self.addEventListener('activate', async function (event) {
//   event.waitUntil((async () => {
//   // Enable navigation preload if it's supported.
//   // See https://developers.google.com/web/updates/2017/02/navigation-preload
//     if ('navigationPreload' in self.registration) {
//       await self.registration.navigationPreload.enable();
//     }
//   })());

//   // Tell the active service worker to take control of the page immediately.
//   self.clients.claim();
// });

// self.addEventListener('fetch', function (event) {
//   // We only want to call event.respondWith() if this is a navigation request
//   // for an HTML page.
//     event.respondWith((async () => {
//       try {
//         // First, try to use the navigation preload response if it's supported.
//         const preloadResponse = await event.preloadResponse;
//         if (preloadResponse) {
//           return preloadResponse;
//         }

//         return await caches.match(event.request) || await fetch(event.request);
//       } catch (error) {
//         // catch is only triggered if an exception is thrown, which is likely
//         // due to a network error.
//         // If fetch() returns a valid HTTP response with a response code in
//         // the 4xx or 5xx range, the catch() will NOT be called.
//         console.log('Fetch failed; returning offline page instead.', error);

//         const cache = await caches.open(CACHE_NAME);
//         const cachedResponse = await cache.match(OFFLINE_URL);
//         return cachedResponse;
//       }
//     })());
// });


//////////////////////////////////////////////////////////////////////////////////////////////////




