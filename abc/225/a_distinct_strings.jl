function main()
    s = readline()
    n = length(Set(s))
    if n == 1
        println(1)
    elseif n == 2
        println(3)
    else
        println(6)
    end
end

main()
