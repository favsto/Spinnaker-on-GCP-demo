const details = require('./host-details');

test('test frontend service', () => {
    expect(details().status).toBe("ok");
});