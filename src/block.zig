const std = @import("std");

pub fn main() !void {
    {
        const x: u8 = 42;
        std.debug.print("x: {}\n", .{x});
    }
    const x: u8 = blk: {
        const y: u8 = 13;
        const z = 42;
        break :blk y + z;
    };

    std.debug.print("x: {}\n", .{x});

    switch (x) {
        0...20 => std.debug.print("x is between 0 and 20\n", .{}),

        30, 31, 32 => std.debug.print("x is 30, 31, or 32\n", .{}),

        40...60 => |n| std.debug.print("It's {}\n", .{n}),

        77 => {
            const a = 1;
            const b = 2;
            std.debug.print("a + b = {}\n", .{a + b});
        },

        blk: {
            const a = 100;
            const b = 2;
            break :blk a + b;
        } => std.debug.print("It's 102.\n", .{}),

        else => std.debug.print("x is something else\n", .{}),
    }

    const answer: u8 = switch (x) {
        0...10 => 1,
        42 => 2,
        else => 3,
    };
    std.debug.print("answer: {}\n", .{answer});
}
