const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    var i: usize = 0;

    while (i < 3) {
        print("{} ", .{i});
        i += 1;
    }

    print("\n", .{});

    i = 0;

    while (i < 3) : (i += 1) print("{} ", .{i});
    print("\n", .{});

    i = 0;
    var j: usize = 0;

    while (i < 3) {
        while (j < 3) {
            print("{} ", .{j});
            j += 1;
        }
        print("\n", .{});
        i += 1;
    }

    i = 0;

    outer: while (true) : (i += 1) {
        while (i < 10) : (i += 1) {
            if (i == 4) continue :outer;
            if (i == 6) break :outer;
            print("{} ", .{i});
        }
    }

    print("\n", .{});

    const start: usize = 1;
    const end: usize = 20;
    i = start;
    const n: usize = 13;
    const in_range = while (i <= end) : (i += 1) {
        if (n == i) break true;
    } else false;

    print("{} in {} to {}? {}\n", .{ n, start, end, in_range });

    count_down = 3;

    while (countDownIterator()) |num| print("{} ", .{num});
    print("\n", .{});
}

var count_down: usize = undefined;

fn countDownIterator() ?usize {
    return if (count_down == 0) null else blk: {
        count_down -= 1;
        break :blk count_down;
    };
}
