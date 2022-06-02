parseints() = parse.(Int, split(readline()))

function solve(x, y)
    z = 0
    ax = abs(x)
    ay = abs(y)
    if ax < ay
        if x < 0
            z += 1
        end
        z += ay - ax
        x = ay
    elseif ax > ay
        if x > 0
            z += 1
        end
        z += ax - ay
        x = -ay
    end
    if x != y
        z += 1
    end
    z
end

function main()
    x, y = parseints()
    println(solve(x, y))
end

main()
