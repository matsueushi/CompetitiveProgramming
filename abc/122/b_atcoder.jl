function main()
    s = readline()
    ans = 0
    cs = "ACGT"
    curlen = 0
    for i in 1:length(s)
        if s[i] ∈ cs
            curlen += 1
        end

        if s[i] ∉ cs || i == length(s)
            ans = max(ans, curlen)
            curlen = 0
        end
    end
    println(ans)
end

main()
