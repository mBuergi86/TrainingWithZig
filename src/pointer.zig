const std = @import("std");

pub fn main() !void {
    const a: u8 = 0;
    const a_ptr = &a;

    std.debug.print("a_ptr: {}, type of a_ptr: {}\n", .{ a_ptr.*, @TypeOf(a_ptr) });

    std.debug.print("\n", .{});

    var b: u8 = 0;
    const b_ptr = &b;

    b_ptr.* += 1;

    std.debug.print("b_ptr: {}, type of b_ptr: {}\n", .{ b_ptr.*, @TypeOf(b_ptr) });

    std.debug.print("\n", .{});

    var c_ptr = a_ptr;
    c_ptr = b_ptr;

    std.debug.print("c_ptr: {}, type of c_ptr: {}\n", .{ c_ptr.*, @TypeOf(c_ptr) });

    std.debug.print("\n", .{});

    var array = [_]u8{ 1, 2, 3, 4, 5, 6 };
    var d_ptr: [*]u8 = &array;

    std.debug.print("d_ptr[3]: {}, type of d_ptr: {}\n", .{ d_ptr[3], @TypeOf(d_ptr) });

    std.debug.print("\n", .{});

    d_ptr[0] += 2;

    std.debug.print("d_ptr[0]: {}, type of d_ptr: {}\n", .{ d_ptr[0], @TypeOf(d_ptr) });

    std.debug.print("\n", .{});

    const e_ptr = &array;

    std.debug.print("e_ptr[0]: {}, type of e_ptr: {}\n", .{ e_ptr[0], @TypeOf(e_ptr) });

    std.debug.print("\n", .{});

    e_ptr[0] += 3;

    std.debug.print("e_ptr[0]: {}, type of e_ptr: {}\n", .{ e_ptr[0], @TypeOf(e_ptr) });
    std.debug.print("array[0]: {}\n", .{array[0]});
    std.debug.print("e_ptr.len: {}\n", .{e_ptr.len});

    std.debug.print("\n", .{});
}
