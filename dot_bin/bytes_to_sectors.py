#!/usr/bin/env python3

"""Get byte offsets with proper alignment, for use in manipulating partitions"""


import sys


def gibibytes_to_bytes(gibibytes: float) -> int:
    return round(gibibytes * 1024 * 1024 * 1024)


def bytes_to_gibibytes(bytes_: int) -> float:
    return bytes_ / 1024 / 1024 / 1024


class Drive:
    def __init__(self, sector_size: int, sector_count: int):
        self.sector_size = sector_size
        self.sector_count = sector_count

    def aligned_offset(self, gibibytes: float):
        """Input desired gigabyte offset, return closest aligned offset in sectors

        Args:
            gibibytes: Gigabyte offset
        """
        sectors = self.gibibytes_to_sectors(gibibytes)
        aligned_sectors = round(sectors / self.sector_count) * self.sector_count
        return aligned_sectors

    def bytes_to_sectors(self, bytes: int) -> int:
        div, mod = divmod(bytes, self.sector_size)
        return bytes / self.sector_size

    def sectors_to_bytes(self, sectors: int) -> int:
        return sectors * self.sector_size

    def gibibytes_to_sectors(self, gibibytes: float):
        return self.bytes_to_sectors(gibibytes_to_bytes(gibibytes))

    def sectors_to_gibibytes(self, sectors: int):
        return bytes_to_gibibytes(self.sectors_to_bytes(sectors))


if __name__ == "__main__":
    drive = Drive(512, 65535)
    status = 0

    args = sys.argv[1:]
    if not args:
        print(f"Usage: {sys.argv[0]} <gibibytes> [<gibibytes>...]", file=sys.stderr)
        exit(1)

    for arg in args:
        try:
            aligned_sectors = drive.aligned_offset(float(arg))
            print(f"{arg}GiB ~= {aligned_sectors}s")
        except ValueError:
            print(f"Invalid argument: {arg}", file=sys.stderr)
            status = 1

    exit(status)
