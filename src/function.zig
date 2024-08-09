const std = @import("std");
const print = std.debug.print;

fn add(a: u8, b: u8) u8 {
    return a +| b;
}

fn printU8(n: u8) void {
    print("{d}\n", .{n});
}

// A function that never returns
fn oops() noreturn {
    @panic("Oops!");
}

// If a function is never called, it isn't even evaluated
fn never() void {
    @compileError("Never happens...");
}

pub fn sub(a: u8, b: u8) u8 {
    return a -| b;
}

// An 'extern' function is linked in form an external object file
extern "c" fn atan2(x: f64, y: f64) f64;

// An 'export' function is linked in from another Zig file
export fn mul(a: u8, b: u8) u8 {
    return a *| b;
}

// You can force inlining of a function, but usually not nevessary
inline fn answer() u8 {
    return 42;
}

fn addOneNot(n: u8) void {
    n += 1;
}

fn addOne(n: *u8) void {
    n.* += 1;
}

pub fn main() !void {
    var n: u8 = 9;

    addOne(&n);
    print("n: {}\n", .{n});
}
