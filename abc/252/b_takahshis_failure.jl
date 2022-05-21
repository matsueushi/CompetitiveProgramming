parseints() = parse.(Int, split(readline()))

function solve(n, k, as, bs)
    bset = Set(bs)
    amax = maximum(as)
    for i in 1:n
        (as[i] == amax && i ∈ bset) && return true
    end
    false
end

function main()
    n, k = parseints()
    as = parseints()
    bs = parseints()
    println(ifelse(solve(n, k, as, bs), "Yes", "No"))
end

main()
