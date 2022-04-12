function solve(n, as, bs)
    same = sum(as .== bs)
    println(same)
    aset = Set(as)
    match = [b for b in bs if b ∈ aset]
    println(length(match) - same)
end

function main()
    n = parse(Int64, readline())
    as = parse.(Int64, split(readline()))
    bs = parse.(Int64, split(readline()))
    solve(n, as, bs)
end

main()
