function main()
    n = parse(Int, readline())
    as = zeros(Int, n)
    for i in 1:n
        as[i] = parse(Int, readline())
    end
    am = maximum(as)
    sas = sort(as, rev=true)
    snd = sas[2]
    for i in 1:n
        println(as[i] == am ? snd : am)
    end
end

main()
