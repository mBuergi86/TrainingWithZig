const std = @import("std");

pub fn main() !void {
    const t: bool = true;
    const f: bool = false;

    std.debug.print("t: {}, f: {}\n", .{ t, f });

    std.debug.print("t: {}, f: {}\n", .{ @intFromBool(t), @intFromBool(f) });

    var maybe_byte: ?u8 = null;
    std.debug.print("maybe_byte: {?}\n", .{maybe_byte});
    maybe_byte = 42;
    std.debug.print("maybe_byte: {?}\n", .{maybe_byte});

    var the_byte = maybe_byte.?;
    the_byte = maybe_byte orelse 13;

    std.debug.print("the_byte: {any}\n", .{the_byte});

    if (maybe_byte) |b| {
        std.debug.print("b is {}\n", .{b});
    } else {
        std.debug.print("maybe_byte is null\n", .{});
    }

    if (maybe_byte) |_| {
        std.debug.print("It's not null.\n", .{});
    }

    if (maybe_byte == null) {
        std.debug.print("It's null.\n", .{});
    }

    if (t) std.debug.print("It's {}!.\n", .{t});

    the_byte = if (maybe_byte != null and maybe_byte.? == 42)
        42 * 2
    else
        0;

    std.debug.print("the_byte: {}\n", .{the_byte});
}
