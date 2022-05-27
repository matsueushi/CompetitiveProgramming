function main()
    s = readline()
    res = 0
    c = ""
    l = 1
    n = length(s)
    while l ≤ n
        for r in l:n
            if c != s[l:r] && (r - l + 1 != n - r || s[l:r] != s[r+1:end])
                res += 1
                c = s[l:r]
                l = r + 1
                break
            end
        end
    end
    println(res)
end

main()
