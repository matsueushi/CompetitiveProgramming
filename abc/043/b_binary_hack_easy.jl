function main()
    s = readline()
    chars = Char[]
    for x in s
        if x == '0' || x == '1'
            push!(chars, x)
        elseif !isempty(chars)
            pop!(chars)
        end
    end
    println(join(chars))
end

main()
