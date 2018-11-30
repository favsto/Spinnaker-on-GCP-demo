/* 
Copyright 2018 Injenia Srl

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. 
*/

var http = require('http');
var os = require('os');
var fs = require('fs');

var VERSION = fs.readFileSync("version");

const details = require('./host-details');

/**
 * Request handler: it responds with a JSON if you ask for /backend, with a phrase otherwise
 */
var handleRequest = function(request, response) {
    var hostname = os.hostname();
    console.log(new Date() + " - " + hostname + ": " + request.url);

    switch (request.url) {
        case "/backend":
            var reply = details();
            reply.version = "" + VERSION;

            response.writeHead(200);
            response.end(JSON.stringify(reply));
            break;

        default:
            response.writeHead(200);
            response.end("Hi there :) I'm " + hostname + " - " + VERSION);

    }
};

/* I'm listening on localhost:8080 */
console.log("Starting Backend server to port 8080");
var www = http.createServer(handleRequest);
www.listen(8080);
