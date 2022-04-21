function main()
    s = readline()
    a, b = parse.(Int, split(readline()))
    for i in 1:length(s)
        if i == a
            print(s[b])
        elseif i == b
            print(s[a])
        else
            print(s[i])
        end
    end
end

main()
