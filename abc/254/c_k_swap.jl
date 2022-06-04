parseints() = parse.(Int, split(readline()))

function solve(n, k, as)
    for i in 1:k
        as[i:k:n] = sort(as[i:k:n])
    end
    issorted(as)
end

function main()
    n, k = parseints()
    as = parseints()
    println(ifelse(solve(n, k, as), "Yes", "No"))
end

main()
