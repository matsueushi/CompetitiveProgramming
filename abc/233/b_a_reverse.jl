function main()
    l, r = parse.(Int, split(readline()))
    s = readline()
    print(s[1:l-1])
    print(s[r:-1:l])
    print(s[r+1:end])
end

main()
