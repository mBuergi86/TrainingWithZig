const print = std.debug.print;
const std = @import("std");

pub fn main() !void {
    var array = [_]u8{ 1, 2, 3, 4, 5 };

    print("array: {any}\n", .{array});

    const array_ptr: [*]u8 = &array;

    print("array: {}\n", .{@TypeOf(array_ptr)});
    print("array with reference: {*}\n", .{&array_ptr});
    print("array to convert a pointer to an integer: {d}\n", .{@intFromPtr(array_ptr)});

    const slice: []u8 = array_ptr[0..array.len];

    print("slice: {}\n", .{@TypeOf(slice)});
    print("slice: {d}\n", .{slice});

    const zero: usize = 0;

    const a_slice: []u8 = &array;
    a_slice[0] += 1;
    print("a_slice[0]: {}, a_slice.len: {}\n", .{ a_slice[0], a_slice.len });

    var b_slice: []u8 = array[zero..];
    b_slice.ptr += 2;
    b_slice.len -= 2;
    print("b_slice: {any}\n", .{b_slice});

    const c_slice: []const u8 = a_slice[0..3];
    print("c_slice: {any}\n", .{c_slice});

    const d_slice = array_ptr[zero..2];
    print("d_slice: {any}\n", .{d_slice});

    array[4] = 0;
    const e_slice: [:0]u8 = array[0..4 :0];
    print("e_slice[e_slice.len]: {}\n", .{e_slice[e_slice.len]});

    const start: usize = 2;
    const length: usize = 3;
    const f_slice = array[start..][0..length];
    print("f_slice: {any}\n", .{f_slice});
}
