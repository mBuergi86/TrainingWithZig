const std = @import("std");

const Color = enum {
    red,
    green,
    blue,

    fn isRed(self: Color) bool {
        return self == .red;
    }
};

const Number = union {
    int: u8,
    float: f64,
};

const Token = union(enum) {
    keyword_if,
    keyword_switch: void,
    digit: usize,

    fn is(self: Token, tag: std.meta.Tag(Token)) bool {
        return self == tag;
    }
};

pub fn main() void {
    var fav_color: Color = .red;
    std.debug.print("fav_color: {s}, is red? {}\n", .{ @tagName(fav_color), fav_color.isRed() });
    fav_color = .blue;
    std.debug.print("fav_color: {s}, is red? {}\n", .{ @tagName(fav_color), fav_color.isRed() });

    std.debug.print("fav_color as int: {}\n", .{@intFromEnum(fav_color)});

    fav_color = @enumFromInt(1);
    std.debug.print("2 as Color: {s}\n", .{@tagName(fav_color)});

    switch (fav_color) {
        .red => std.debug.print("It's red.\n", .{}),
        .green => std.debug.print("It's green.\n", .{}),
        .blue => std.debug.print("It's blue.\n", .{}),
    }

    var fav_num: Number = .{ .int = 13 };
    std.debug.print("fav_num: {}\n", .{fav_num.int});

    fav_num = .{ .float = 3.1415 };
    std.debug.print("fav_num: {d:.4}\n", .{fav_num.float});

    var tok: Token = .keyword_if;
    std.debug.print("is if? {}\n", .{tok.is(.keyword_if)});

    switch (tok) {
        .keyword_if => std.debug.print("if\n", .{}),
        .keyword_switch => std.debug.print("switch\n", .{}),
        .digit => |d| std.debug.print("digit {}\n", .{d}),
    }

    tok = .{ .digit = 42 };

    switch (tok) {
        .keyword_if => std.debug.print("if\n", .{}),
        .keyword_switch => std.debug.print("switch\n", .{}),
        .digit => |d| std.debug.print("digit {}\n", .{d}),
    }

    if (tok == .digit and tok.digit == 42) std.debug.print("It's 42\n", .{});
}
