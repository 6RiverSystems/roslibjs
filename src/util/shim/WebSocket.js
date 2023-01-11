module.exports = (typeof window !== 'undefined' && typeof window.WebSocket !== 'undefined') ? window.WebSocket : WebSocket;
