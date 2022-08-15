#!/usr/bin/env python3

desired_dimensions = {'width': 10240, 'height': 5760}
center = (22400, 14800)


def main():
    half_width = desired_dimensions['width'] / 2
    half_height = desired_dimensions['height'] / 2

    left = center[0] - half_width
    right = center[0] + half_width
    top = center[1] - half_height
    bottom = center[1] + half_height

    print(f'top: {top:n}')
    print(f'bottom: {bottom:n}')
    print(f'left: {left:n}')
    print(f'right: {right:n}')


if __name__ == "__main__":
    main()
