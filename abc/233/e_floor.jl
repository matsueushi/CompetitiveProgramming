function solve(x)
    n = length(x)
    ns = parse.(Int, collect(x))
    s = sum(ns)
    a = s
    res = [a % 10]
    for i in n:-1:1
        s = s - ns[i]
        a = a ÷ 10 + s
        (i == 1 && a % 10 == 0) || push!(res, a % 10)
    end
    join(reverse(res))
end

function main()
    x = readline()
    println(solve(x))
end

main()
