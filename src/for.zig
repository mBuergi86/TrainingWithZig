const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    var array = [_]u8{ 0, 1, 2, 3, 4, 5 };

    for (array) |item| print("{} ", .{item});
    print("\n", .{});

    for (array[0..3]) |item| print("{} ", .{item});
    print("\n", .{});

    for (array[0..3], 0..3) |item, index| print("{}: {}, ", .{ index, item });
    print("\n", .{});

    for (array, 0..) |item, index| print("{}: {}, ", .{ item, index });
    print("\n", .{});

    for (array[0..2], array[1..3], array[2..4]) |a, b, c| print("{}-{}-{} ", .{ a, b, c });
    print("\n", .{});

    for (3..10) |item| print("{} ", .{item});
    print("\n", .{});

    var sum: usize = 0;

    for (array) |item| {
        if (item == 3) continue;
        if (item == 4) break;
        sum += item;
    }

    print("sum: {}", .{sum});
    print("\n", .{});

    sum = 0;
    outer: for (0..10) |oi| {
        for (1..3) |ii| {
            if (oi == 5) break :outer;
            sum += ii;
        }
    }

    print("sum: {}", .{sum});
    print("\n", .{});

    for (&array) |*item| {
        item.* *= 2;
        print("{} ", .{item.*});
    }
    print("\n", .{});

    const maybe_nums = [_]?u8{ 0, 1, 2, null, null };

    const just_nums = for (maybe_nums, 0..) |opt_num, i| {
        if (opt_num == null) break maybe_nums[0..i];
    } else maybe_nums[0..];

    print("just_nums: {any}\n", .{just_nums});
}
