var os = require('os');

function details() {
    var hostname = os.hostname();
    var reply = {
        status: "ok",
        hostname: hostname
    };
    return reply;
}
module.exports = details;