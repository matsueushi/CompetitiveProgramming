parseints() = parse.(Int, split(readline()))

function solve(n, m, xs)
    sort!(xs)
    diffs = diff(xs)
    sort!(diffs)
    c = min(n, m + 1)
    sum(diffs[1:end-(c-1)])
end

function main()
    n, m = parseints()
    xs = parseints()
    println(solve(n, m, xs))
end

main()
