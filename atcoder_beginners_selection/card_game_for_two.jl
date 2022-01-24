function main()
    _ = readline()
    xs = parse.(Int64, split(readline()))
    ys = sort(xs, rev = true)
    alice = sum(ys[1:2:length(ys)])
    bob = sum(ys[2:2:length(ys)])
    println(alice - bob)
end

main()