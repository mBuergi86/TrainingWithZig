const src = @import("std");
const expect = src.testing.expect;

test "always false" {
    try expect(false);
}