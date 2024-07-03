const std = @import("std");
const expect = std.testing.expect;

// const constant: i32 = 42; // signed 32-bit integer
// var mutable: u32 = 42; // unsigned 32-bit integer
                    
// @as performs an explicit type coercion
// const inferred_constant: @as(i32, 5);
// var inferred_variable: @as(u32, 5);

// undefined value
// const a: i32 = undefined;
// const b: u32 = undefined;

// arrays
const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
const b = [_]u8{ 'h', 'e', 'l', 'l', 'o' };

const length = b.len;

pub fn main() void {
    std.debug.print("Hello, {s}!\n", .{"world"});
    std.debug.print("Hello, {s}!\n", .{b});
    std.debug.print("{d}", .{length});
}
