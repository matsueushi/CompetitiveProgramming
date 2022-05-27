parseints() = parse.(Int, split(readline()))

function main()
    d, n = parseints()
    n == 100 && (n += 1)
    print(n)
    for i in 1:d
        print("00")
    end
    println()
end

main()
