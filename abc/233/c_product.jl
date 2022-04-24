function solve(n, x, ls, ass)
    res = 0
    for idx in Iterators.product(Iterators.OneTo.(ls)...)
        a = x
        for i in 1:n
            a, v = divrem(a, ass[i][idx[i]])
            v != 0 && (a = -1; break)
        end
        a == 1 && (res += 1)
    end
    res
end

function main()
    n, x = parse.(Int, split(readline()))
    ls = zeros(Int, n)
    ass = Vector{Int}[]
    for i in 1:n
        as = parse.(Int, split(readline()))
        ls[i] = as[1]
        push!(ass, as[2:end])
    end
    println(solve(n, x, ls, ass))
end

main()
