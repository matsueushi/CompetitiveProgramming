function main()
    s = readline()
    n = length(s)
    ss = String[]
    for i in 0:n-1
        push!(ss, s[i+1:end] * s[1:i])
    end
    sort!(ss)
    println(first(ss))
    println(last(ss))
end

main()
