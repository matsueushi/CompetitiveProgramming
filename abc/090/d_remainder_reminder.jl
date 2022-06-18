parseints() = parse.(Int, split(readline()))

function solve(n, k)
    k == 0 && return n^2
    res = 0
    for b in k+1:n
        x, y = divrem(n, b)
        res += max(0, y - k + 1) + x * (b - k)
    end
    res
end

function main()
    n, k = parseints()
    solve(n, k) |> println
end

main()
