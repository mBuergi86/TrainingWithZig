const src = @import("std");
const expect = src.testing.expect;

test "always true" {
    try expect(true);
}