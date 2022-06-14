parseints() = parse.(Int, split(readline()))

function f1(x)
    res = ((x + 1) >> 1) & 1
    for i in 1:40
        f = max(0, (x + 1) % (1 << (i + 1)) - (1 << i))
        if isodd(f)
            res |= 1 << i
        end
    end
    res
end

solve(a, b) = f1(a - 1) ⊻ f1(b)

function main()
    a, b = parseints()
    solve(a, b) |> println
end

main()
