/**
 * 6RS Changes - This shim could not work in a webworker.  Protect against accessing
 * the window
 */

exports.DOMImplementation =
  typeof window !== 'undefined' && window.DOMImplementation;
exports.XMLSerializer = typeof window !== 'undefined' && window.XMLSerializer;
exports.DOMParser = typeof window !== 'undefined' && window.DOMParser;
