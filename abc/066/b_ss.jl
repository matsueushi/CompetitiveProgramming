function main()
    s = readline()
    n = length(s)
    m = iseven(n) ? n ÷ 2 - 1 : n ÷ 2
    for i in m:-1:1
        s[1:i] == s[i+1:2*i] && (println(2 * i); return)
    end
end

main()
