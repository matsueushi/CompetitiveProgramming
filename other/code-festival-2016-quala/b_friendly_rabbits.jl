parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    friend = [Set{Int}() for _ in 1:n]
    res = 0
    for i in 1:n
        if i ∈ friend[as[i]]
            res += 1
        end
        push!(friend[i], as[i])
    end
    res
end

function main()
    n = parseint()
    as = parseints()
    println(solve(n, as))
end

main()
