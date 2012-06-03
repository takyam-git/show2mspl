# SHOW! SHOW! MySQL PROCESS LIST !!!
Auto reloading MySQL "SHOW PROCESSLIST" query,
and view of html.

 * demo movie [http://youtu.be/cg7Pli7ZQd0](http://youtu.be/cg7Pli7ZQd0)

## Installation
1. install NodeJS v0.6.* and socketstream.
  * [look here](https://github.com/socketstream/socketstream/blob/master/INSTALL.md)
2. clone this repository
  * git clone git://github.com/takyam-git/show2mspl.git
3. npm install
  * cd show2mspl
  * npm install
  * npm link socketstream
4. config mysql user info (require can requrest query 'show processlist;')
  * modify app.js line 6-8.
5. run app
  * node app.js
  * (recommended) forever app.js
6. access on your browser
  * http://yourdomain:3000/

## How to use
 * click "START" button
  * default clicked.
  * start get "show processlist" results.
 * click "STOP" button
  * stop get "show processlist".
 * change interval
  * you can change interval. 1sec - 10sec.
 * filtering
  * you can filter to result.
  * use javascript regexp.
   * ex)
    * ^root$
    * SELECT \* FROM.+

## Author
 * twitter: [@takyam](http://twitter.com/#!takyam)
 * blog: [たくろぐ(taklog)](http://takl.org/)