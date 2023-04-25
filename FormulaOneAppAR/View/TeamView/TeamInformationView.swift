//
//  TeamInformationView.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 21/4/2023.
//

import SwiftUI

import SwiftUI

struct TeamInformationView: View {
//    @ObservedObject var viewModel: TeamInformationViewModel
    let viewModel = TeamInformationViewModel(
        fullTeamName: "Mercedes-AMG Petronas Formula One Team",
        base: "Brackley, United Kingdom",
        teamChief: "Toto Wolff",
        technicalChief: "James Allison",
        chassis: "Mercedes",
        powerUnit: "Mercedes",
        highestRaceFinish: "1 (x140)",
        polePositions: "125",
        fastestLaps: "86",
        firstTeamEntry: "1970 French Grand Prix",
        worldChampionships: "8 (2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021)"
    )
    var body: some View {
        VStack(spacing: 0) {
            InformationTemplate(label: "Team name", value: viewModel.fullTeamName)
            InformationTemplate(label: "Base", value: viewModel.base)
            InformationTemplate(label: "Team chief", value: viewModel.teamChief)
            InformationTemplate(label: "Technical chief", value: viewModel.technicalChief)
            
            HStack(spacing: 0) {
                InformationTemplate(label: "Chasis", value: viewModel.chassis)
                InformationTemplate(label: "Power unit", value: viewModel.powerUnit)
            }
            
            HStack(spacing: 0) {
                InformationTemplate(label: "First team entry", value: viewModel.highestRaceFinish)
                
                if viewModel.polePositions != "N/A" {
                    InformationTemplate(label: "Pole positions", value: viewModel.polePositions)
                }
                
                if viewModel.fastestLaps != "N/A" {
                    InformationTemplate(label: "Fastest laps", value: viewModel.fastestLaps)
                }
            }
            
            HStack(spacing: 0) {
                InformationTemplate(label: "First team entry", value: viewModel.firstTeamEntry)
                
                if viewModel.worldChampionships != "N/A" {
                    InformationTemplate(label: "World Championships", value: viewModel.worldChampionships)
                }
            }
        }
    }
}

struct InformationTemplate: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.bold)
            Spacer()
            Text(value)
        }
        .padding()
    }
}


struct TeamInformationView_Previews: PreviewProvider {
    static var previews: some View {
        TeamInformationView()
    }
}


