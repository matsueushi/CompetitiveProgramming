function main()
    s = readline()
    ns = zeros(Int, 3)
    for x in s
        i = x - 'a' + 1
        ns[i] += 1
    end
    m = minimum(ns)
    ns .-= m
    println(ifelse(maximum(ns) ≤ 1, "YES", "NO"))
end

main()
