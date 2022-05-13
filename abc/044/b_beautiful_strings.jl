function main()
    w = readline()
    flag = trues(26)
    for c in w
        ind = c - 'a' + 1
        flag[ind] = !flag[ind]
    end
    println(all(flag) ? "Yes" : "No")
end

main()
