//! Example of calling the C function `plugin_lib_register`, using ctor to mark
//! a rust function to execute when dlopen loads this library

extern crate ctor;
use ctor::*;
use std::ffi::{CString};

include!(concat!(env!("OUT_DIR"), "/bindings.rs"));

#[ctor]
fn entrance_point() {
    let s = CString::new("🦀 hello from rust! 🦀").expect("CString::new failed");
    unsafe { plugin_lib_register(s.as_ptr()) };
}
