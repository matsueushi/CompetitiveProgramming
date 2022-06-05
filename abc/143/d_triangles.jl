parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, ls)
    sort!(ls)
    res = 0
    for i in 1:n-2
        for j in i+1:n-1
            x = ls[i] + ls[j]
            ind = searchsortedlast(ls, x - 1)
            res += ind - j
        end
    end
    res
end

function main()
    n = parseint()
    ls = parseints()
    println(solve(n, ls))
end

main()
