const MAXN = 2000

function main()
    n = parse(Int64, readline())
    xs = parse.(Int64, split(readline()))
    bs = falses(MAXN + 1)
    for x in xs
        bs[x+1] = true
    end
    for i in 0:MAXN
        bs[i+1] || (println(i); break)
    end
end

main()
