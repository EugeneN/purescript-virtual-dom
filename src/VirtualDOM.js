// module VirtualDOM
exports.showPatchObjectImpl = JSON.stringify;

exports.createElement = require('virtual-dom/create-element');

//exports.diff$prime = require('virtual-dom/diff');

exports.diff = function(a){
  return function(b){
    return require('virtual-dom').diff(a, b);
  }
}

exports.patch = function(a){
  return function(b){
    return function(){
      return require('virtual-dom').patch(a, b);
    }
  }
}

// exports.patch$prime = require('virtual-dom/patch');

// exports.mkEff = function(action) { return action; }
