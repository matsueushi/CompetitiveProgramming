function main()
    n, t = parse.(Int, split(readline()))
    ts = parse.(Int, split(readline()))
    s = 0
    for i in 1:n-1
        s += min(t, ts[i+1] - ts[i])

    end
    s += t
    println(s)
end

main()
