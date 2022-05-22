parseints() = parse.(Int, split(readline()))

function solve(sx, sy, tx, ty)
    dx = tx - sx
    dy = ty - sy
    move = 'R'^dx * 'U'^dy * 'L'^dx * 'D'^dy * 'D' * 'R'^(dx + 1) * 'U'^(dy + 1) * "LU" * 'L'^(dx + 1) * 'D'^(dy + 1) * 'R'
    println(move)
end

function main()
    sx, sy, tx, ty = parseints()
    solve(sx, sy, tx, ty)
end

main()
