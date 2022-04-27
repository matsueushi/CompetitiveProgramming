function main()
    s, t, x = parse.(Int, split(readline()))
    if s < t
        println(s ≤ x < t ? "Yes" : "No")
    else
        println((x < t || s ≤ x) ? "Yes" : "No")
    end
end

main()
