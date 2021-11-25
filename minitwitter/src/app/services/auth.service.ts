import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { SignUpDto } from '../models/dto/SignUpDto.dto';
import { SignUpResponse } from '../models/interfaces/SignUp.interface';
import { Observable } from 'rxjs';


const API_BASE_URL = `${environment.apiBaseUrl}/auth`;

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json'
  })
  
};

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient) { }


  signUp(dto : SignUpDto) : Observable<SignUpResponse> {
    return this.http.post<SignUpResponse>(`${API_BASE_URL}/signup`, dto, DEFAULT_HEADERS);
  }
}
