function solve(k, n, as)
    push!(as, as[1] + k)
    ds = sort!(diff(as))
    k - last(ds)
end

function main()
    k, n = parse.(Int, split(readline()))
    as = parse.(Int, split(readline()))
    println(solve(k, n, as))
end

main()
